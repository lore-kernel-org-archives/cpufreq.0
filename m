From: Georg Sauthoff <g_sauthoff@web.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Sun, 17 Aug 2003 23:09:04 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308172309.04569.g_sauthoff@web.de>
References: <200308160043.30649.g_sauthoff@web.de> <20030816185320.GA833@brodo.de> <200308162157.26732.g_sauthoff@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200308162157.26732.g_sauthoff@web.de>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

On Saturday 16 August 2003 21:57, Georg Sauthoff wrote:
> > Probably a BUG I introduced in the latest backport. Hopefully I'll have
> > the time tomorrow to update it. In the meantime: what does /proc/cpufreq
> > tell?
>
> It does tell (AFAIRC):
> min-policy max-policy ... (sorry don't remember the end of the line)
>
> I will mail the exact line tommorow.

Ok, here it comes:
# cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy
# echo -n "0%0%100%userspace" > /proc/cpufreq
# cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy

Hope that helps.

Regards
Georg Sauthoff
