From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 8/8] patch cpupower_ivy_bridge_support.patch
Date: Mon, 26 Nov 2012 16:46:16 +0100
Message-ID: <201211261646.16882.trenn@suse.de>
References: <1349788867-65962-1-git-send-email-trenn@suse.de> <1349788867-65962-9-git-send-email-trenn@suse.de> <3559687.YhYd0sZzjh@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <3559687.YhYd0sZzjh@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux@dominikbrodowski.net

On Saturday, November 24, 2012 10:49:52 AM Rafael J. Wysocki wrote:
> Please add (1) a useful subject, (2) a changelog and (3) a sign-off tag.
Sure, sorry about that.
But be careful, this one is wrong:

> > +	case 0x2D: /* SNB Xeon */
> > +	case 0x3A: /* IVB */
> > +	case 0x3D: /* IVB Xeon */
It's family 0x3E
a copy and paste bug that has been taken over from
turbostat, there it already got adjusted from 0x3D to 0x3E.

I resend the whole series today or tomorrow.

Thanks,

  Thomas
