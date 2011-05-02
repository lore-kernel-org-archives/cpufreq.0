From: Dave Jones <davej@redhat.com>
Subject: Re: Detection of HyperThreading
Date: Mon, 2 May 2011 12:15:57 -0400
Message-ID: <20110502161557.GA25722@redhat.com>
References: <alpine.DEB.2.02.1105021542530.2853@eragon.insync.za.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1105021542530.2853@eragon.insync.za.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pieter De Wit <pieter@insync.za.net>
Cc: cpufreq@vger.kernel.org

On Mon, May 02, 2011 at 03:47:30PM +1200, Pieter De Wit wrote:
 > Hello Guys,
 > 
 > I found something quite weird over the weekend. I have a few machines that 
 > claim they have HT (using cat /proc/cpuinfo). These machines doesn't 
 > really support HT (both with the number of threads and Intel's website)
 > 
 > I was wondering:
 > 
 > a) Is this the right list to send to (Sorry if not)

no, this list is for cpu frequency scaling. linux-kernel would have been
more appropriate. 

 > and
 > 
 > b) How is the HT flag detected ?
 > 
 > CPU's like the Core2 Duo E6300 doesn't have HT, but yet the flag is 
 > displayed ? See http://ark.intel.com/Product.aspx?id=27248 for info. I can 
 > send a dump of /proc/cpuinfo later from home.
 
the 'ht' flag in /proc/cpuinfo means "this cpu knows how to report how
many siblings it has".  On a CPU which doesn't have hyperthreading, that
number will be 0.

	Dave

