From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5353] cpufreq_conservative: cpu always in slowest mode even
	under high load
Date: Mon, 19 Dec 2005 11:46:55 -0800
Message-ID: <200512191946.jBJJktlB030452@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5353





------- Additional Comments From linux@markus-schaub.de  2005-12-19 11:38 -------
Created an attachment (id=6858)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=6858&action=view)
cat /proc/acpu/processor/CPU/*

Same situation as in the bug ddescription , machine is pretty cold
Kernel Version is now 2.6.15-rc2

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
