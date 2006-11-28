From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Bug: Pentium M not always detected by CPUFREQ
Date: Mon, 27 Nov 2006 20:57:48 -0500
Message-ID: <20061128015748.GB21472@isilmar.linta.de>
References: <200611211646.29488.hs4233@mail.mn-solutions.de> <1164128474.31358.682.camel@laptopd505.fenrus.org> <200611220848.03746.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933934AbWK1B5v@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200611220848.03746.hs4233@mail.mn-solutions.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Cc: Arjan van de Ven <arjan@infradead.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Wed, Nov 22, 2006 at 08:48:03AM +0100, Holger Schurig wrote:
> > you don't have a pentium M
> 
> In that case p4-clockmod has a bug, because it said that I have 
> one.

That bug should be fixed in -mm, cpufreq-git and 2.6.20.

Thanks,
	Dominik
