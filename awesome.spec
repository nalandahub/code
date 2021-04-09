Name:       awesome
Version:    1
Release:    1
Summary:    Most simple RPM package
License:    No License

%description
This is my first RPM package, which does echoing.

%prep
# noupdates

%build
cat > awesome.sh <<EOF
#!/usr/bin/bash
echo "Awe\$""ome"
EOF

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 awesome.sh %{buildroot}/usr/bin/awesome.sh

%files
/usr/bin/awesome.sh

%changelog
#no changes
