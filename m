From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7463] CPU frequency scaling(cpufreq) does not work.
	speedstep-centrino.c problem
Date: Wed, 31 Jan 2007 06:23:29 -0800
Message-ID: <200701311423.l0VENTAQ028732@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7463





------- Additional Comments From olda.plchot@gmail.com  2007-01-31 06:14 -------
Hello again,
  I think it could be ACPI related problem. Maybe some types of BIOS does not
provide that frequency tables in a correct way. I heard some people resolved
this problem by upgrading BIOS. Maybe we could chceck if we obtained correct
values and if not, we could try values coded in the speedstep-centrino.c, which
are based on the Intel datasheets.

Olda

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
