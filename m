From: bugme-daemon@osdl.org
Subject: [Bug 3211] New: incorrect number of frequencies detected by cpufreq
Date: Sat, 14 Aug 2004 15:16:16 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408142216.i7EMGGBs016801@fire-1.osdl.org>
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

http://bugme.osdl.org/show_bug.cgi?id=3211

           Summary: incorrect number of frequencies detected by cpufreq
    Kernel Version: 2.6.8.1
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: nicolasdufour@earthlink.net


Distribution: Arch Linux
Hardware Environment: Laptop Dell Inspiron 5150, Pentium IV-M 2.8
Software Environment: module speedstep_smi
Problem Description: this module doesnt detect correctly all the availables
frequencies to manage the current frequency of the processor. It was working in
2.6.3 !

Steps to reproduce:
1. modprobe speedstep_smi
2. cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq
3. display 1599960 (1599MHz) instead of something around 300000 (300MHz)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
