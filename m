From: "Jeff Chua" <jeff.chua.linux@gmail.com>
Subject: Re: Suspend to RAM regression tracked down
Date: Mon, 3 Jul 2006 14:08:55 +0800
Message-ID: <b6a2187b0607022308k361c9664uef9d521db10f4d08@mail.gmail.com>
References: <1151837268.5358.10.camel@idefix.homelinux.org>
	 <44A80B20.1090702@goop.org>
	 <1151880764.5358.32.camel@idefix.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750715AbWGCGI5@vger.kernel.org>
In-Reply-To: <1151880764.5358.32.camel@idefix.homelinux.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jean-Marc Valin <Jean-Marc.Valin@usherbrooke.ca>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

Can you try 2.6.17 with this patch from Greg. I had same problem on my
IBM X60s, as you mentioned ... sometimes, can't resume after a few
suspend/resume cycles. But this patch seems to do the trick even if I
don't load USB modules sometimes.

Subject: USB: get USB suspend to work again

Yeah, it's a hack, but it is only temporary until Alan's patches
reworking this area make it in.  We really should not care what devices
below us are doing, especially when we do not really know what type of
devices they are.  This patch relies on the fact that the endpoint
devices do not have a driver assigned to us.

Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/usb/core/usb.c |    2 ++
 1 file changed, 2 insertions(+)

--- gregkh-2.6.orig/drivers/usb/core/usb.c
+++ gregkh-2.6/drivers/usb/core/usb.c
@@ -991,6 +991,8 @@ void usb_buffer_unmap_sg (struct usb_dev

 static int verify_suspended(struct device *dev, void *unused)
 {
+       if (dev->driver == NULL)
+               return 0;
        return (dev->power.power_state.event == PM_EVENT_ON) ? -EBUSY : 0;
 }



On 7/3/06, Jean-Marc Valin <Jean-Marc.Valin@usherbrooke.ca> wrote:
> > There was a race in ondemand and conservative which made them lock up on
> > resume (possibly only on SMP systems though).  There's a patch for that
> > in current -mm, but I suspect there's another problem (still haven't had
> > any time to track it down).
>
> Any link to the patch and the thread about the problem (if any)? Also,
> was the race introduced in 2.6.12-rc5-git6? If not, it's a completely
> different problem because my machine worked fine with 2.6.12-rc5-git5.
