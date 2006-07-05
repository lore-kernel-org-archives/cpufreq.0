From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6793] New: AMD K8 driver with C'n'Q enabled hangs the system
Date: Wed, 5 Jul 2006 01:28:52 -0700
Message-ID: <200607050828.k658SqK7005056@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6793

           Summary: AMD K8 driver with C'n'Q enabled hangs the system
    Kernel Version: 2.6.17
            Status: NEW
          Severity: blocking
             Owner: cpufreq@www.linux.org.uk
         Submitter: t.artem@mailcity.com


It's almost impossible to reach any AMD engineers via AMD's website so I post
this bug report here. This problem is related to both Linux and Windows AMD K8
CPU drivers.

My hardware configuration is the following:
CPU: AMD Sempron 3400+ Socket 754
RAM: 2x512 Corsair 2,5-3-3-8@1T
MB: GigaByte K8NS Pro (nForce3 250GB chipset)

The problem: Upon enabling cool'n'quite technology via K8 driver as soon as the
first cpu frequency change occurs my system hangs up completely. I was trying to
solve this problem by weakening memory timings up to 4-4-4-10@2T also I've tried
to put memory modules in all possible memory slots but all in vain.

Suddenly I've found a nice Windows utility RMClock which CAN change CPU
frequency without hangings. But it's only possible if I load "Registered DIMMs"
timer settings. These are:

Good Phase Error: 100us
Clock Ramp Hysteresis: 2000ns
HTT Clock PLL Lock Counter: 100us

With these settings everything works fine.

So my question is: Is it possible to implement these settings in Linux driver
via powernow-k8 module options?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
