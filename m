From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] cpufreq {d,}printk adjustments
Date: Wed, 26 Apr 2006 16:27:41 +0200
Message-ID: <20060426142741.GA30902@isilmar.linta.de>
References: <444F93E5.76E4.0078.0@novell.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932336AbWDZO1n@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <444F93E5.76E4.0078.0@novell.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Beulich <jbeulich@novell.com>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Hi,

On Wed, Apr 26, 2006 at 03:38:13PM +0200, Jan Beulich wrote:
> Convert some dprintk-s to printk-s as their use of KERN_* indicates they
> were meant to be used that way. Alternatively, the KERN_* prefixes could
> be removed and the dprintk-s then retained.

For these ones, removing KERN_* and leaving them as dprintk() seems to be
the better choice. The other two patches look fine to me.

Thanks!

	Dominik
