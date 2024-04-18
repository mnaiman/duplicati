mkdir /home/seluser/published/
chmod +S /home/seluser/published/
sudo dotnet publish -o /home/seluser/published/ /sources/Duplicati.sln

/home/seluser/published/Duplicati.Server &
timeout 240 bash -c 'until printf "" 2>>/dev/null >>/dev/tcp/$0/$1; do sleep 1; echo Checking if server started...; done' 127.0.0.1 8200
echo Running Tests...
python3 /sources/guiTests/guiTest.py