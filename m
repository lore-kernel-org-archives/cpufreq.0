From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] s3c64xx: Add VDDINT voltage scaling
Date: Mon, 5 Dec 2011 19:50:59 +0000
Message-ID: <20111205195059.GI7467@opensource.wolfsonmicro.com>
References: <1323109322-24130-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <11611639.9NBo3p2F8o@flatron>
 <20111205192506.GE7467@opensource.wolfsonmicro.com>
 <1968469.lEDYUZcgoo@flatron>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1968469.lEDYUZcgoo@flatron>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Dave Jones <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org

On Mon, Dec 05, 2011 at 08:45:47PM +0100, Tomasz Figa wrote:
> On Monday 05 of December 2011 19:25:06 Mark Brown wrote:

> > 133MHz and VDDINT at 1.05V.  And driver code showing some variation from
> > the power design guide :/

> I think that people from Samsung should be able to say something a bit more 
> precise on this. Am I right?

Here's hoping :)

> > If it's a question of regulator quality the board should just be adding
> > an offset in the constraints without the SoC drivers having to worry
> > their pretty little heads about it.  Like I say it's not an unknown

> Right, there is a field for regulator offset in regulation_constraints 
> struct indeed. Somehow I missed it, sorry.

It's possible you first looked at this with a kernel that didn't have
that feature - I added it sometime this year.
