From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Wed, 7 Mar 2007 09:07:45 -0800
Message-ID: <200703071707.l27H7jnG025728@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8075





------- Additional Comments From mark.langsdorf@amd.com  2007-03-07 09:07 -------
Again, this message happens when Linux can't find or decode the _PSS objects. 
Make sure you have the ACPI processor module enabled and loaded before enabling
powernow-k8

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
