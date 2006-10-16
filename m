From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7376] New: ondemand and conservative governors are not working
	as expected
Date: Mon, 16 Oct 2006 13:20:40 -0700
Message-ID: <200610162020.k9GKKeYg020830@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7376

           Summary: ondemand and conservative governors are not working as
                    expected
    Kernel Version: 2.6.18, 2.6.18.1, 2.6.19-rc1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: caglar@pardus.org.tr


Most recent kernel where this bug did not occur: 2.6.16
Distribution: Pardus Linux, Alpha 3
Hardware Environment: Sony Vaio VGN-FS215B Notebook
Software Environment:
Problem Description:

Ondemand or conservative governors couldnWt change current frequency of CPU
while system is idle with 2.6.18, 2.6.18.1, 2.6.19-r1 kernels. 2.6.16 works fine
without any problem. 

As a workaround unplug/plug ac adapter magically solves the problem and these
governors start to run as expected.

In ordet to be sure this problem is kernel related, all userspace softwares
which capable of powermanagent are stopped (hal/powersave etc.)

acpidump, /proc/cpuinfo, dmesg output, dmidecode output, lsmod output, top, ps
output and CONFIG will follow this report as attachments

Whole LKML thread can be found @
http://www.gossamer-threads.com/lists/linux/kernel/692970

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
