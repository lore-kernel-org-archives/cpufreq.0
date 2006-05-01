From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5507] longhaul driver breaks 8139too
Date: Mon, 1 May 2006 00:55:52 -0700
Message-ID: <200605010755.k417tqEB004088@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5507





------- Additional Comments From rafalbilski@interia.pl  2006-05-01 00:55 -------
> From my point of view i would say, that the device is not getting the transmit
> interrupt sometimes, but i may be completetly wrong at this point ...

You are right. Processor is "offline" when frequency is changed. All interrupts
except 0 are masked. PCI bus mastering must also be turn off. That code You
deleted is responsible for halting PCI bus.
For "Processor type and features->Timer frequency" = 100Hz "offline" time is max
1/50s, for 250Hz it is 1/125s and for 1000Hz 1/500s.


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
