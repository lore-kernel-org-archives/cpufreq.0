From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5383] VIA Nehemiah ondemand scaling governor critical DMA error
Date: Thu, 6 Oct 2005 11:44:57 -0700
Message-ID: <200510061844.j96Iiv1d007478@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5383





------- Additional Comments From davej@codemonkey.org.uk  2005-10-06 11:43 -------
There's not a great deal that can be done about this currently, as we lack
infrastructure to tell other drivers "please complete current in-flight dma
transfers, and disable new ones until I say its safe".

VIA longhaul is one of the worst-cases for this, other cpufreq implementations
don't seem to matter as much, but total lockups happen quite easily with DMA +
longhaul.

I'm not sure how we can fix this.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
