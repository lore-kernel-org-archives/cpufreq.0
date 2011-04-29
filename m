From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/2] cpufreq: use dynamic debug instead of custom
 infrastructure
Date: Fri, 29 Apr 2011 16:14:01 -0400
Message-ID: <20110429201400.GB12256@redhat.com>
References: <20110327130446.GA6759@comet.dominikbrodowski.net>
 <20110425140218.GA27378@comet.dominikbrodowski.net>
 <20110425162820.GA18401@redhat.com>
 <20110425204302.GA13032@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110425204302.GA13032@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Mon, Apr 25, 2011 at 10:43:02PM +0200, Dominik Brodowski wrote:
 > On Mon, Apr 25, 2011 at 12:28:20PM -0400, Dave Jones wrote:
 > > On Mon, Apr 25, 2011 at 04:02:18PM +0200, Dominik Brodowski wrote:
 > >  > ping... any chance to get this and the second patch into 2.6.40?
 > >  
 > > This looks like it needs a bit more work..
 > 
 > Argh, some debug messages and formatting obviously were broken. Could you
 > apply this patch on top, or squash it with the other patches if you prefer
 > that? Thanks & best,

I had to squash all three diffs together, as there were compile failures
introduced when applying just the first, with or without this third patch.

It's all pushed out now, and seems to be holding together.
Haven't boot tested it at all yet.

	Dave
