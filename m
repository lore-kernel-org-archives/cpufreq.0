From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5860] New: ondemand and speedstep-ich fail on inspiron 8500
Date: Tue, 10 Jan 2006 05:47:52 -0800
Message-ID: <200601101347.k0ADlqdB010221@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5860

           Summary: ondemand and speedstep-ich fail on inspiron 8500
    Kernel Version: 2.6.14
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: sg02r@ecs.soton.ac.uk


Most recent kernel where this bug did not occur:
Distribution: Fedora Core 4
Hardware Environment: Dell Inspiron 8500
Software Environment:
Problem Description:

The ondemand (and conservative) scaling governors can be loaded from the modules
and are listed as available governors, but they will not work. echo "ondemand" >
scaling_governor has no effect.
Fedora kernels ship with the speedstep-ich module built into the kernel. Other
drivers are provided as modules, but cannot be loaded as the speedstep-ich
claims it works with my chipset and so blocks the module loading.

I did file a bug report with redhat  which contains some more details.

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=165494

Steps to reproduce:
1) Install FC4 on a I8500. 
2) Load the ondemand module. 
3) Attempt to use the ondemand governor.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
