From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 2.6] cpufreq longrun driver fix
Date: Mon, 5 Apr 2004 18:59:40 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405175940.GO5688@redhat.com>
References: <20040405155012.GI2718@deep-space-9.dsnet>
	<20040405173835.GA7328@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040405173835.GA7328@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stelian Pop <stelian@popies.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

 > > The following patch does even more, it tries every value from 80%
 > > to 10% in 10% steps, until it succeeds in lowering the performance.
 > > I'm not sure this is the best way to do it but in any case, 
 > > it works for me (and should continue to work for everybody else).
 > 
 > Patch looks good to me -- thanks, Stelian! 
 > Dave, could you merge it, please?

Yup, will be in cpufreq-bk soon, and the next -mm that
Andrew rolls up.

		Dave
