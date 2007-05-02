From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Wed, 2 May 2007 11:41:10 -0700
Message-ID: <200705021841.l42IfA9l026794@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From bugzilla.20.dsurawicz@spamgourmet.com  2007-05-02 11:41 -------
Created an attachment (id=11376)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11376&action=view)
dmesg output

You are correct, Daniel. I applied now your latest patch and the frequency
table should now be correct.

Concerning the discrepancy between 'detected 1333.446MHz processor' and max
frequency of 1266768MHz: Could this be related with my broken BIOS and do I
then need to correct the DSDT or is this a more general prob? In the latter
case, I would file another bug.

BR,
Dustin

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
