From: Jan Rychter <jan@rychter.com>
Subject: Pentium-M (Centrino): no power saved?
Date: Thu, 18 Sep 2003 19:09:27 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m24qz9r0ko.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hmm. I'm puzzled. I've just done a checkout of the latest CVS version of
cpufreq for 2.4, applied it to a 2.4.22 kernel and tried the thing out
on a Toshiba SS7/290LNKW laptop.

The speedstep-centrino module loads happily and tells me I have a 900MHz
Pentium-M. (this is a family 6 model 9 stepping 5 CPU).

I've tried echo "0%100%powersave" > /proc/cpufreq 
  and 
 echo "0%50%powersave" > /proc/cpufreq

and much to my surprise, even though /proc/cpufreq echoes my changes, I
can see no resulting changes in power consumption as reported by ACPI
battery proc entry.

Other things make a difference: whether the system is able to use C3,
display brightness, wireless card, etc. But changing the cpufreq entry
doesn't seem to do anything.

Am I doing something wrong?

--J.
