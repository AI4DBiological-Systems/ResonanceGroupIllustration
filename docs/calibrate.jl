

base_folder = "calibrate"
#base_folder = "quantify"

target_dir = joinpath(pwd(), base_folder)


# print.
tmp = filter(isdir, readdir(target_dir; join=true))

function printmarkdowntext(tmp, target_dir, base_folder)
    for folder_name in tmp
        
        base_name = folder_name[length(target_dir)+2:end]

        file_list = readdir(folder_name)

        r = 0
        for i = 1:length(file_list)
            
            if file_list[i][end-4:end] == ".html" && file_list[i][end-8:end] != "data.html"
                r += 1
                plot_path = joinpath(base_name, file_list[i]) # for SH_explore 
                println("[$(base_name)-region-$(r)]($(base_folder)/$(plot_path))")
                println()
            end
        end
 
    end
end

printmarkdowntext(tmp, target_dir, base_folder)

# weave.
#using Weave
#weave("index.jmd")