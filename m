From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5860] ondemand and speedstep-ich fail on inspiron 8500
Date: Tue, 17 Jan 2006 07:01:57 -0800
Message-ID: <200601171501.k0HF1vv2029218@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5860

piel@lifl.fr changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |piel@lifl.fr
             Status|NEW                         |ASSIGNED



------- Additional Comments From piel@lifl.fr  2006-01-17 06:50 -------
Yes, that's completely "normal". speedstep-ich was not setting information about
the transition latency in the 2.6.15 neither. Mattia Dongili has done the work
to fix this... and you are (somehow) lucky, it's available in the 2.6.16-rc1
that Linus has released an hour ago ;-)



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
