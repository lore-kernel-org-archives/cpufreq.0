From: Davide <louigi600@yahoo.it>
Subject: Problems with longhaul on a C3 (epia ME6000,
	MII6000 and 800) all non nehemiah core
Date: Mon, 9 Jan 2006 14:21:56 +0100 (CET)
Message-ID: <20060109132156.16964.qmail@web52607.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@brodo.de, linux@brodo.de
Cc: mike@ossmann.com, cpufreq@www.linux.org.uk, dwhedon@debian.org

I have left a post on VIA forums
"http://forums.viaarena.com/messageview.aspx?catid=28&threadid=67875&enterthread=y"
 regarding this for a long time and got no answer.

Becoming more and mode desparate for help I started
looking for emails on the source code and
documentation; this is why I'm writing to you.

After longhaul module loading everything seems to be
woorking fine.
I can doo all one would expect in the /sys fs,
problems rise later:
I left my EPIA 800 running at lowest possible
frequency for some time (399MHz with userspace
governor).
Apparently everything was working but after some time
(something in the order of one hour) the system froze
irreparably. Screen went blank and mouse/keyboard
activity does not light it again (brobably because the
system is totally hung). 
I'ts not a one off problem because I have ben able to
reproduce the problem on all my VIA mini-itx boards.

I did a little more investigation on the matter and
found this:
It only happens wheni I insert the longhaul module
(I've had my boards running for days without locking
up when the longhaul module is not loaded),
I've reproduced the problem on EPIA 800, M6000 and
MII6000,
I've reproduced the problem bothe in high and low cpu
load,
I've been monitoring the cpu temperature with external
sensor that supprisingly reports that the temperature
shoots up after the freeze,
I have not changet power supply and/or cooling system,
I've reproduced the problem on 2.6.12.x and 2.6.13
kernels (all unpatched),
I've upgraded the bios on all my boards to get the
"via 2 slot pci raiser card" working (but I'm not
currently using it).

Meantime I came across a XP-M based laptop ...
powernow-k7 works fine without the freeze after some
time.

So I decided to google a little mor on this and found
this on http://www.cpqlinux.com/acpi-howto.html
>Hang Recovery
>Recovering from a GUI hard lock up:
>If you get no feedback either from the keyboard or
monitor, then to >recover you should:
>1. if your network is up, then ssh/rsh/telnet into
your box and tell it to >reboot
>2. if network is not up, then try this key sequence:
CTRL+ALT+F1 >CTRL+ALT+DEL. You will not get any video 
>or keyboard feedback but this 
>_MAY_ blindly switch to tty1 (CTRL+ALT+F1) and press
ing CTRL+ALT+DEL >_MAY_ cause your system to do a
polite reboot rather than a hard shutdown, >then wait
an appropriate amount 
>of time that it usually takes to reboot 
>your machine

This is describing some problems that can arise when
acpi manipulates cpu frequency on certain power state
transitions and actually I'm using acpi on all the
systems that produce the problem.

Any idea as to why ?
Any hope for a fix ?

Regards
David

Chiacchiera con i tuoi amici in tempo reale! 
 http://it.yahoo.com/mail_it/foot/*http://it.messenger.yahoo.com 
