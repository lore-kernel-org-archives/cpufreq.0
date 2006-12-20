From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7713] CPU Frequency scaling has wrong frequencies on Abit AB9
	Pro
Date: Tue, 19 Dec 2006 20:59:01 -0800
Message-ID: <200612200459.kBK4x1Ys022878@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7713





------- Additional Comments From bjrosen@polybus.com  2006-12-19 20:54 -------
I figured out what the issue is. ABit slightly overclocks their boards, the
default clock for an E6700 is 2.72GHz rather than 2.66GHz. When I set the clock
frequency to 2.66GHz the scaling frequency values were correct. For any other
frequency the values are set to the 1000000 800000 600000.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
