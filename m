From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6849] speedstep-centrino does not work on Intel Core Duo T2400
Date: Mon, 17 Jul 2006 08:05:07 -0700
Message-ID: <200607171505.k6HF5772016269@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6849

alexey.y.starikovskiy@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |alexey.y.starikovskiy@intel.
                   |                            |com
             Status|NEW                         |ASSIGNED



------- Additional Comments From alexey.y.starikovskiy@intel.com  2006-07-17 08:01 -------
please also attach output of             
acpidump -a 0x3FE8FF56 -l 0x000001A8

acpidump -a 0x3FE900FE -l 0x00000089
 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
