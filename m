From: bugme-daemon@osdl.org
Subject: [Bug 3144] modprobe speedstep-smi fails
Date: Mon, 2 Aug 2004 12:05:18 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408021905.i72J5IMB012551@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3144





------- Additional Comments From schwientek@web.de  2004-08-02 12:05 -------
Attached /proc/cpuinfo.  If I trie to load speedstep-smi dmesg tells the  
following two lines:  
cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x4c080020, 0x0  
cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x5d0000  
  
I have also tried "paparoots" suggestion, with more success:  
  
I can change dynamically (either via speedstep, or manually) the  
frequencie. /proc/cpuinfo shows the correct values later.  
/var/log/messages or dmesg shows no error.  
I think, the "performance mode works also ok.  
However, a small problem remains:  
If I set the speed to "powersave" mode, the drivers    choose the same speed  
as for the performance mode.   
  
Steffen  

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
