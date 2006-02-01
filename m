From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5985] speedstep-smi not detecting speedstep-capability with
	early Pentium 3 Coppermine
Date: Tue, 31 Jan 2006 19:36:54 -0800
Message-ID: <200602010336.k113askA024932@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5985





------- Additional Comments From miura@da-cha.org  2006-01-31 19:36 -------
Could you try with module options?

modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1

Driver ignores a broken information and try to proceed.
There are many reports that some coppermine platforms 
have odd bios. I think these platforms might be made before
Intel/Microsoft defined the interface specification.

In MS Windows, PC vendor can overwrite these parameters
by setting the some registory values as follows:

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\P3\Parameters\HackFlags==0x5
or 0x1 
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\P3\Parameters\SmiCmdPort==SMI
Cmd Data Port
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\P3\Parameters\SmiCmdData==SMI
Cmd Data Value

You can find right values in pre-installed windows registory.
These values may be set by Intel Speedstep Applet pre-installed or bandled. A
registry location is defined in Microsoft's "Windows Native Processor
Performance Control" document.

The situation 'perf_level:0x47534943' is not an offset change. 
These values are retrived in arch/i386/boot/setup.S:507
        movl    $0x0000E980, %eax               # IST Support
        movl    $0x47534943, %edx  #<--         # Request value
        int     $0x15

        movl    %eax, (96)
        movl    %ebx, (100)
        movl    %ecx, (104)
        movl    %edx, (108)     #<--

so this means BIOS doesn't return a proper value on %edx,
because of setting %edx as signature before call BIOS.

Hiroshi Miura 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
