From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7463] CPU frequency scaling(cpufreq) does not work.
	speedstep-centrino.c problem
Date: Thu, 18 Oct 2007 13:01:59 -0700 (PDT)
Message-ID: <20071018200159.6EDB811D10C@picon.linux-foundation.org>
References: <bug-7463-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-7463-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7463





------- Comment #12 from leszek.tarkowski@gmail.com  2007-10-18 13:01 -------
I have laptop (MAxdata 8100X) with dothan 1.6GHz and no luck - both
speedstep-centrino and acpi-cpufreq (kernel 2.6.22 from gutsy). So there are
STILL some old laptops with are in need for hardcoded freq tables (everyting
was working on old ubuntu kernels with were pathed this way). Please don't
ignore old machines...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
