From: Patrick Mochel <mochel@osdl.org>
Subject: Re: kernel/cpufreq.c, drivers/cpufreq/ or kernel/power/cpufreq/ ?
Date: Thu, 21 Aug 2003 10:44:42 -0700 (PDT)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0308211044230.18579-100000@cherise>
References: <20030821071832.GA1973@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030821071832.GA1973@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: davej@suse.de, cpufreq@www.linux.org.uk


> Right now cross-architecture cpufreq files are in
> drivers/cpufreq/ 	and the cpufreq core is in
> kernel/cpufreq.c
> 
> IMHO these files should move to one destination, and I'd favour
> drivers/cpufreq/ for that. Or is kernel/power/cpufreq/ a better location for
> that?

I think drivers/cpufreq/ is best.


	Pat
