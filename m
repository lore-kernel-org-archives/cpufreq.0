From: bugme-daemon@osdl.org
Subject: [Bug 3144] modprobe speedstep-smi fails
Date: Sun, 1 Aug 2004 23:52:18 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408020652.i726qIju019621@fire-1.osdl.org>
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





------- Additional Comments From linux@brodo.de  2004-08-01 23:52 -------
Actually, I doubt that it really works properly for you, "paparoot": the
messages you see in the kernel logs mean that the CPU frequency "changed behind
your back": either the BIOS meddled with it, or switching frequencies failed, or
switching frequencies isn't even possible on the CPU in the t22. The checks
which fail if !relaxed_check are there for a reason, after all... there are just
a few very early actually speedstep-capable systems which need that, IIRC.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
