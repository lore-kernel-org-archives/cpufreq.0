From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7532] cpufreq does not get enabled on a core 2 duo E6300
	system.
Date: Wed, 15 Nov 2006 10:48:06 -0800
Message-ID: <200611151848.kAFIm62N018094@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7532

venkatesh.pallipadi@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEW                         |ASSIGNED



------- Additional Comments From venkatesh.pallipadi@intel.com  2006-11-15 10:46 -------

From the first looks it seems that BIOS is not giving the proper Speedstep
information to OS. I will have to look at acpidump in a bit more detail.

Can you make sure you are running the latest BIOS and check whether BIOS has any
option related to Enahanced Speedstep (May be called Intel EST or EIST or some
such thing) is enabled.

Thanks.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
