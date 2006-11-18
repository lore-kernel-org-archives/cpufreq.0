From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7514] No centrino-speedstepping w/  HP nx7400 (rh402et)
Date: Sat, 18 Nov 2006 03:14:05 -0800
Message-ID: <200611181114.kAIBE5DF014132@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7514





------- Additional Comments From meskes@debian.org  2006-11-18 03:12 -------
Created an attachment (id=9557)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=9557&action=view)
Unknown cpu

The problem is that the CPU is not known to the speedstep-centrino driver. It
is model 15 but there is no entry for a model number 15 in the driver. However,
even adding this model number doesn't make it work, but hopefully this
additional info will help. Attached is my cpuinfo file as I seem to have the
same notebook.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
