From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9729] ondemand cpufreq governor doesn't see when
	kcryptd/dm-crypt is busy
Date: Fri, 18 Jan 2008 05:57:48 -0800 (PST)
Message-ID: <20080118135748.1AB2111D107@picon.linux-foundation.org>
References: <bug-9729-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9729-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9729


tch@wpkg.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |REOPENED
         Resolution|UNREPRODUCIBLE              |




------- Comment #2 from tch@wpkg.org  2008-01-18 05:57 -------
Reproduced on yet another machine running 2.6.23.14, using p4-clockmod (max
speed is 1500 MHz):

# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Celeron(R) M processor         1.50GHz
stepping        : 8
cpu MHz         : 187.500
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx bts
bogomips        : 2996.24
clflush size    : 64


# dd if=/dev/mapper/megathecus_crypt of=/dev/null bs=64k count=10000
10000+0 records in
10000+0 records out
655360000 bytes (655 MB) copied, 100.875 seconds, 6.5 MB/s


For the whole test (100 seconds) CPU was almost 100% busy and was always at the
lowest frequency.


Just start "cat /dev/zero | bzip2 >/dev/null" for a second or two, and CPU will
scale up to 1500 MHz and stay there until dd ends.


Starting another dd about ~10 seconds after a previous dd (if running at 1500
MHz, triggered by bzip2) will scale the CPU to full.


Starting another dd about ~30 seconds or more after a previous dd (if running
at 1500 MHz, triggered by bzip2) will *not* scale the CPU up.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
