From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Mon, 18 Aug 2003 11:37:24 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F409E54.20001@basmevissen.nl>
References: <3F3CB378.1000607@basmevissen.nl> <20030815154156.GA1029@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030815154156.GA1029@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@brodo.de>
Cc: Bas Mevissen <sgm@basmevissen.nl>, Cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

> 
> Either 2.4.22-rc2-ac1 or the latest 2.4 backport on www.codemonkey.org.uk -
> but as that's offline at the moment, I'd try -ac. Or 2.6.0-test3-bk-current
> :)
> 

Can someone please make a backport of CPUFREQ to 2.4.22-rc2? The -ac has 
   a new scheduler (backport from 2.6?) and that breaks swsusp for the 
moment. So I would like to go for 2.4.22-rc2 (or later) with the -ac 
patches.

It seems that more people are waiting for a 2.4.22+swsusp+cpufreq, so it 
is not a waste of time.

Regards,

Bas.
