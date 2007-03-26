From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Mon, 26 Mar 2007 13:48:51 -0700
Message-ID: <200703262048.l2QKmpvj001566@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From babassu@postmaster.co.uk  2007-03-26 13:48 -------
After some more testing, it happens going from low power to high power as well.
The consistent behavior is frequency switching fails after successfully
switching the voltage.
Ex. ramp-up from 1Ghz 1.17 V to 2GHz 1.41 V, it changes to 1.41V but frequency
gets stuck at 1GHz (never reaches the desired 2GHz). dmesg shows again:

[13496.636380] powernow-k8: Hardware error - pending bit very stuck - no further
pstate changes possible
[13496.636388] powernow-k8: transition frequency failed


------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
