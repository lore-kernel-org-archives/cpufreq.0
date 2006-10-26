From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7420] cpufreq/powernowd limiting CPU frequency on kernels
	>=2.6.16
Date: Thu, 26 Oct 2006 03:07:53 -0700
Message-ID: <200610261007.k9QA7rCC006618@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7420





------- Additional Comments From interfc@jumpy.it  2006-10-26 02:54 -------
Created an attachment (id=9361)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=9361&action=view)
my config

it's the same thing if I use ACPI_PROCESSOR=m (plus it gives the 2.6.18 bug:
powernowk8 not supported by PSB structure blah blah)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
