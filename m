From: Thierry Lathuille <thierry.lathuille2@libertysurf.fr>
Subject: Problem with ondemand on Athlon
Date: Fri, 31 Oct 2003 14:14:32 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: cpufreq@www.linux.org.uk

Hi,

I just tried Venkatesh's ondemand patches for kernel 2.6.0-test8 on my Ac=
er=20
laptop with Athlon XP1600+.

Everything works fine with performance, powersave and userspace governors=
, I=20
can switch between frequencies without problem.=20

But echoing "ondemand" to=20
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor has unexpected effe=
cts:
- the keyboard stops working - but the mouse still works, I can use apps =
in=20
KDE without problem - as long as I don't need to type anything...
- I can't kill any xterm anymore. But the other applications work and can=
 be=20
killed normally.
- trying to reboot hangs the system.

I tried to figure out how far ondemand was executed, and added some debug=
=20
messages to yours ; So I got :

ONDEMAND START: cpu0, max 1400000, min500000, cur <the last one>
(  then dbs_check_cpu is executed once)
ONDEMAND LIMIT: <idem>
And then, I don't get anything logged after the call to=20
down(&dbs_sem);


I can reproduce the problem every time, whatever the frequency was before=
=2E
Please tell me what infos you need to help solve the problem !

(BTW : I installed cpufreqd-1.1-rc1 since then : this works perfectly !)



Thierry Lathuille
