From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] S3C6410: Support 800MHz operation in cpufreq
Date: Wed, 8 Jun 2011 10:02:38 -0400
Message-ID: <20110608140238.GB7204@redhat.com>
References: <1307540955-10086-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1307540955-10086-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: kgene.kim@samsung.com, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Jun 08, 2011 at 02:49:15PM +0100, Mark Brown wrote:
 > At least some newer S3C6410 silicon supports operation up to 800MHz rather
 > than just 667MHz. Unfortunately I don't have access to any of documentation
 > of this other than some running systems, add a new cpufreq table entry for
 > this based on the behaviour of those systems.
 > 
 > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
 > ---
 > 
 > Kukjin already indicated on several occasions that he was happy with
 > this change but it never seems to get applied or an actual ack.
 
applied, thanks.

	Dave
