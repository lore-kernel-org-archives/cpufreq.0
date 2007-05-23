From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8524] Wrong cpu frequency displayed when overclocked
Date: Wed, 23 May 2007 09:36:32 -0700
Message-ID: <200705231636.l4NGaWX6016181@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8524





------- Additional Comments From paapaa125@hotmail.com  2007-05-23 09:39 -------
Ok, so in the 1st case the correct frequency is actually measured/read from
processor and in the second case cpufreq just substitutes the "stock" values and
hides the true frequency?

Of course, it would be nice to do this the correct way (ie. cpufreq could read
the actual FSB speed and the usable multiplier range and use those values
instead [low_multi * FSB, high_multi * FSB]). After all, all that cpufreq does
is alter the multiplier (on desktop core 2 duo's), right? So showing the correct
freq range and correct freq should be quite easy.

But luckily this issue affects only the displayed values. The processor works at
the correct speed and the scaling works fine.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
