From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Fri, 15 Aug 2003 18:39:04 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030815183904.D21529@flint.arm.linux.org.uk>
References: <3F3CB378.1000607@basmevissen.nl> <20030815154156.GA1029@brodo.de> <200308151853.30238.g_sauthoff@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308151853.30238.g_sauthoff@web.de>; from g_sauthoff@web.de on Fri, Aug 15, 2003 at 06:53:30PM +0200
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georg Sauthoff <g_sauthoff@web.de>
Cc: Cpufreq@www.linux.org.uk

On Fri, Aug 15, 2003 at 06:53:30PM +0200, Georg Sauthoff wrote:
> unfortunely I can't use -ac 2.4. Kernels ... (because of my hardware and not 
> 2.6. because of a Cisco VPN). Is (or was) www.codemonkey.org.uk really the 
> only place, to get the cpufreq backports against vanilla 2.4. kernels?
> 
> What about cvs? And the ftp location mentioned by Bas Mevissen is outdated?

The ftp is updated each night.  Whether it contains anything useful
depends on whether people check the changes into the cvs tree(s).

If people want a 2.4-ac snapshot and the maintainers are willing to
create a cvs branch for them, its pretty simple to add it to nightly
scripts.

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
