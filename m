From: bugme-daemon@osdl.org
Subject: [Bug 3760] no speedste 440bx/zx...
Date: Wed, 17 Nov 2004 06:11:33 -0800
Message-ID: <200411171411.iAHEBXj2015314@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3760

linux@brodo.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |linux@brodo.de
             Status|NEW                         |ASSIGNED



------- Additional Comments From linux@brodo.de  2004-11-17 06:11 -------
please post a cat /proc/cpuinfo and a dmesg of a 2.6.10-rc2-mm1 kernel with
CONFIG_CPU_FREQ_DEBUG set to y and booted with "cpufreq.debug=2" passed as boot
parameter.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
