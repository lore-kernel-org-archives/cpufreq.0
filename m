From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq change appears to cause ps2 mouse hangs
Date: Tue, 26 Apr 2005 12:52:29 +0200
Message-ID: <20050426105229.GV2298@poupinou.org>
References: <20050425190459.34415.qmail@web53603.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050425190459.34415.qmail@web53603.mail.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Oosting <eoosting@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Apr 25, 2005 at 12:04:59PM -0700, Eric Oosting wrote:
> I wanted to bring a problem I am having to your
> attention in hopes that
> you might be able to help me correct my problem.
> 
> I have a dell latitude C600 laptop with a PIII 1Ghz
> proc running the
> latest Ubuntu (5.04) release and 2.6.10. Ubuntu uses
> powernowd to adjust
> frequency scaling.
> 
> My problem is that whenever powernowd changes the
> frequency on my cpu my
> mouse hangs for about a second with the following
> error to
> /var/log/messages:
> 
> Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost synchronization,
> throwing 4 bytes away.
> Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost sync at byte 1
> Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost sync at byte 1
> Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 - driver resynched.
> Apr 22 21:06:34 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost synchronization,
> throwing 1 bytes away.
> Apr 22 21:06:34 localhost kernel: psmouse.c: TouchPad
> at isa0060/serio1/input0 lost sync at byte 1
> 
> This also happens if I have a standard USB mouse
> plugged in. If I disable
> powernowd I don't get any hickups. I don't believe the
> problem is directly
> because of powernowd because I am able to reproduce
> the problem by running
> "echo 700000 >
> /sys/device/system/cpu/cpu0/cpufreq/scaling_setspeed"
> or
> setting it back to 1000000.   
> 
> Have you any ideas on how I might solve or mitigate
> the problems I am
> having? The cpu frequency scaling capabilities of the
> 2.6 kernel are
> wonderful and I would much prefer to fix the problem
> then disable any
> tools that would change the scaling dynamically.
> 

What cpufreq driver are you using (speedstep-ich, speedstep-smi)?
What kind of southbridge (ich or piix4 or whatever)?
Could you post a dmesg and a lspci -v?
Also have you the same problem but without ACPI? (I suspect actually
a problem with the power state, a cat /proc/acpi/processor/*/power may
help also)

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
