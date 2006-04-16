From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Sat, 15 Apr 2006 23:25:39 -0700
Message-ID: <200604160625.k3G6Pd7D004500@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367

oopla@users.sf.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|blocking                    |normal



------- Additional Comments From oopla@users.sf.net  2006-04-15 23:25 -------
changing severity to 'normal', as p4-clockmod now loads and cpufreq works albeit
with very limited (nearly useless wrt pw.saving) cpu-freq.
Also, cpufreq_stats seems not essentials, so temp w.around is to not load it at all.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
