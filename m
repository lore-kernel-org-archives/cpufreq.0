From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: My latest powernow-k8.c
Date: Fri, 19 Mar 2004 13:41:22 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040319124122.GG28592@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1163C59A@txexmtae.amd.com>
	<20040319112429.GB5726@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040319112429.GB5726@elf.ucw.cz>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: linux@dominikbrodowski.de, Cpufreq mailing list <cpufreq@www.linux.org.uk>

On Fri, Mar 19, 2004 at 12:24:29PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Attached are my latest .c and .h ... I am sending the whole files rather than patches, as a check that I did not miss a patch that you wanted. Mail here has been a little less reliable that one might wish for.
> > 
> > I added back in the cpu number in the dprintks to aid MP debugging. I fixed a PSB problem where the battery limits were getting lost. And, I tweaked the smp processor init stuff as discussed in emails.
> > 
> > I am still thinking about the FIXME where Dominik asked for more validity checking. So, that is still FIXME.
> 
> Huh, now this is strange:
> 
> root@amd:~# echo "0%88%88%powersave" > /proc/cpufreq
> root@amd:~# cat /proc/cpufreq
>           minimum CPU frequency  -  maximum CPU frequency  -  policy
> CPU  0      1584000 kHz ( 88 %)  -    1600000 kHz ( 88 %)  - powersave
> root@amd:~#
> 

2.4 or 2.6 ?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
