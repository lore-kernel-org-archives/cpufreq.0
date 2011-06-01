From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/5] CPUFREQ/S3C64xx: Move S3C64xx CPUfreq driver into
 drivers/cpufreq
Date: Wed, 1 Jun 2011 10:58:11 +0100
Message-ID: <20110601095811.GB13591@opensource.wolfsonmicro.com>
References: <20110601094313.GA23122@opensource.wolfsonmicro.com>
 <1306921493-30911-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <BANLkTinR_WLjsgm5ogt_BbJwPFC0Kc1Dqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTinR_WLjsgm5ogt_BbJwPFC0Kc1Dqg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kmpark@infradead.org>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jun 01, 2011 at 06:55:05PM +0900, Kyungmin Park wrote:

> Instead of samsung tree, it should be handled at cpufreq tree.
> CCed the cpufreq maintainer.

Well, it's a something for both really as both trees are updated.  I
sent the orginal copy of this patch to both places but both sets of
maintainers just ignored it (I've never seen any response from the
cpufreq maintainers on this driver ever since I originally submitted
it).  

At the minute I'm mostly just trying to get some of the backlog of
S3C64xx patches I'm accumilating out of my queue :(
