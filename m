From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: 2.4.21 Isn't working for me....
Date: Tue, 26 Aug 2003 11:53:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F4B2E18.9070006@basmevissen.nl>
References: <1061872616.27076.47.camel@localhost>	<20030826064747.GE10585@poupinou.org>
	<3F4B27D6.1000700@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F4B27D6.1000700@wanadoo.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toula Michael <keos@wanadoo.fr>
Cc: cpufreq@www.linux.org.uk

Toula Michael wrote:

> 
> Do the 2.4.22 patch works with linux.2.4.22 final or only with -rc ????
> Cheers,
> 

final is rc4 + makefile patch
rc4 is small delta upon rc3

So rc3, rc4 and final probably patch without rejects and rejects with 
older versions are likely easy to fix. But if there is no real reason to 
  use something before 22, please use 2.4.22.

Regards,

Bas.
