From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpufreq stops working after a while
Date: Tue, 15 Aug 2006 09:49:00 +0200
Message-ID: <1155628140.4302.1079.camel@queen.suse.de>
References: <44DCCB96.5080801@rtr.ca> <20060811114631.4a699667.akpm@osdl.org>
	<1155372733.7809.6.camel@skylla.slagter.name>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1155372733.7809.6.camel@skylla.slagter.name>
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
Content-Type: text/plain; charset="us-ascii"
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

On Sat, 2006-08-12 at 10:52 +0200, Erik Slagter wrote:
> On Fri, 11 Aug 2006 14:25:26 -0400 Mark Lord <lkml@rtr.ca> wrote:
> 
> > One of my notebooks (Dell Latitude X1) has a 1.1GHz Pentium-M ULV processor.
> > This chip can change CPU speeds from 600 -> 800 -> 1100 Mhz.
> > 
> > I use speedstep-centrino with it, and after boot all is usually okay.
> > But after a few hours of operation, it stops shifting to the highest frequency
> > even under continuous 100% load (or not).  Eventually it gets stuck at 600Mhz
> > and stays there until I reboot.

After a few hours, urgh.

Dells limit their frequency to lowest after unplugging AC and allow all
freqs after some time (some secs) again.

There were two issues solved on the Dells some months ago:

- The frequency after you unplug AC adapter is already reduced by BIOS, 
  that confused the cpufreq driver.
- There was a race in sysfs writes. If you e.g. change governor or 
  possibly some other cpufreq related sysfs file while the frequency
  got limited by BIOS, the real max freq value got overridden by the
  temporarily limited max freq value and you are stuck to lowest freq
  forever.

Do you use any userspace daemon (cpuspeed, powersaved, ...) to control
cpuspeed?
If yes, you should first try without. It should be enough to:
- load your hw cpufreq module
- load the ondemand governor module
- echo ondemand >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

If it still happens we know at least it can't be some kind of sysfs race
again or userspace tools do not remember the wrong max_freq value. Then
some debug output or how to reproduce this a bit faster would be nice...

Maybe with something like that:
LOAD_FACTOR=40   # adjust this one to the power of your machine to let
                 # cpufreq switch up and down, or if it does not switch 
                 # up and down in the beginning it should stay at
                 # 800 (could be 5-20 on yours?),
                 # check with (in separate console):
# cd /sys/devices/system/cpu/cpu0/cpufreq/
# watch -n1  cat scaling_cur_freq scaling_max_freq

for ((x=200;x<1000;x+=5));do
    # give load
    for ((y=0;y<$LOAD_FACTOR;y++)); do
        echo "10 k 2 v p" |dc >/dev/null
    done;
    # then sleep
    usleep $((x*1000))   # maybe the right value here triggers the bug?
    echo "sleep $x milli secs"
done;

Maybe it's triggered if you start some other process(es) while this is
running?

    Thomas
