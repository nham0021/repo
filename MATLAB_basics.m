%% MATLAB GUI (this is a section, use Ctrl+Enter to run it)

% This is a comment

a = 1       % define variable and print output
b = 20;     % execute but suppress the output

c = a + b;  % the results will be assigned to a new variable c
disp(c)     % display variable in the command window

clear a     % remove a from workspace
clear b     % select and right click to evaluate a single line

%% lists (aka arrays or vectors)

my_list = [7,3,5,1,2,4,8];

% get list length
length(my_list)

% use round brackets to read one or more entries from the list
my_list(1)
my_list(2:4)
my_list(2:end)
my_list(2:end-1)

% remove item from list
my_list(2) = []
length(my_list)

% errors
my_list(20)
my_list(c)

%% 2D array (matrix)

% array or zeros
M = zeros(4,2)

% DICOM file (sub-01, ses-01, T1w)
Y = dicomread('1.2.826.0.1.3680043.8.498.28512825607834333336032256335161030630-4-1-1estnpe.dcm');

% matrix dimensions
size(Y)

% read parts
Y(1,1)
Y(1:5,1:3)
Y(20,:)

% visualise matrix
figure
imagesc(Y)


%% convert DICOM to NIFTI
spm fmri
% click on "DICOM Import", select all DICOM files, save as single .nii 


%% strings and char arrays

strHello        = "Hello world!";
strExample      = "This is a string.";
charExample     = 'This is a char.';
doubleExample   = 3.907;

% concatenate string + string
strHello + strExample
% concatenate string + chars
strHello + charExample
% concatenate string + number
strExample + doubleExample

% chars must be concatenated using square brackets
'one'+'two'
['one','two']

% what happens if we concatenate a char and a double?
charExample + doubleExample

% list variables in the workspace
whos

% build file paths using 'fullfile' instead of slash or backslash for
% Linux compatibility (e.g. on MASSIVE)
fullfile('dir1','dir2','file.mat');
fullfile('/','projects','xw69','myproject');
fullfile('/','scratch','xw69','myproject');


%% if-else block

% clear the workspace (most scripts start with this command)
clear

dir_base = fullfile('/','scratch','xw69','myproject')

% Let's check if dir_base actually exists or if we missed anything
if isfolder(dir_base)
    disp('Folder found')
    a = 1
else
    warning('Folder NOT found')
    a = 2
end

% use smart indentation
% ...

% set keyboard shortcuts for commenting/uncommenting (and use Windows mode)
% ...

%% get list of subfolders in dir_base
clear

dir_base    = fullfile('/','projects','xw69_scratch','myproject');

d           = dir(dir_base); % list folder contents
subfolders  = {d([d(:).isdir]).name}'; % select folders only (not files)
subfolders(ismember(subfolders,{'.','..'})) = []; % remove temp folders

subfolders{1} % note the use of curly brackets to index cell arrays
subfolders(1) % what happens if we use round brackets instead?


%% for loop block

% simple example: print number from 1 to n
n = 5;
for i = 1:n
    disp(i)
end

% more useful: loop through a list
subj_list = [7,2,5,1];
for i = 1:length(subj_list)
    disp(subj_list(i))    
end

%% Exercise: filter files in a directory

% approach 1: loop through files and use conditional statement
% ...


% approach 2: use dir function and wildcards
% ...


% use breakpoints for debugging
%...

% use assertions for robustness and testing
%assert()

%% Miving files (caution needed)

for i_subj = 1:length(name_subj)
    subj = name_subj{i_subj};
    sprintf('\nLoading Subject : %s\n', subj)
    subj_dir = fullfile(dir_base, subj);
%     glmdir = fullfile(subj_dir,'glm_corrected'); 
%     DCM_name = ['DCM_' group '_' subj]; %sprintf('DCM_LSD_%s_Placebo',subj)
    
    dir(fullfile(subj_dir,'*t1.nii'))

%     source = fullfile(glmdir,[DCM_name '.mat'])
%     destination_dir = fullfile(home,'LSD','results',group)
%     mkdir(destination_dir)
%     copyfile(source, destination_dir)
%     movefile(source, destination_dir)
end

%% Exercise: spm12 preprocessing test

% starting from dir_base, pick a single subject to test the preprocessing
dir_base = fullfile('/','projects','xw69_scratch','myproject');
dir_subj = fullfile(dir_base,'group1','subject001');
dir_func = fullfile(dir_subj,'func');
dir_struc = fullfile(dir_subj,'struc');

% test that the folders exists (same as before)
% ...
% if isfolder(dir_func) ...
% ...

%  select functional data (replace 'AB' with first letters of your files)
filter_func = '^AB.*\.nii$';
f = spm_select('ExtFPList', dir_func, filter_func);

% if the filter is correct, this should display a list of NIFTI files
disp(f)

% Then repeat with structural files
% filter_struc = ...
% s = spm_select(...
% disp(s)


%% functions

help spm_dcm_fmri_csd % or right-click -> help

open spm_dcm_fmri_csd % or right-click -> open


%% structures

my_structure.my_field1 = 1;
my_structure.my_field2 = "some text";
my_structure.my_field3.subfield1 = [1,2,3];
my_structure.my_field3.subfield2 = zeros(2,2);
% open in the workspace and note that field3 is a structure

% load and explore existing DCM output file...

