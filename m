From: Toula Michael <keos@wanadoo.fr>
Subject: little question
Date: Fri, 05 Sep 2003 22:46:50 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <3F58F63A.9070507@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,
I've got a Sony fr102 laptop with a AthlonXP-powernow 2000+ (1,6 GHZ)
I use linux 2.4.22 with a daily archive of cpufreq (20030905) and=20
everything works fine....
I do a
$ echo -n "0%0%100%userspace" > /proc/cpufreq

to be able to set the frequency manually.
Then i do :
$ cd /proc/sys/cpu/0/
$ cat speed-min > speed

Ok, so the speed is set, a little =93cat speed=94 confirms that.
I just would like to know if the core voltage is also set ?
In others words, do the VID change with the FID when I use the userspace=20
governor ?

I think CPUFreq is a great project, but don=92t you think it lacks a good=
=20
user-friendly documentation ( I know, I know the source code is the best=20
one ;)? Any help appreciated in this area ?

THX for all this very great work
Mike
