From: Dave Jones <davej@suse.de>
Subject: Re: rebased cpufreq patch?
Date: Mon, 7 Jul 2003 19:38:39 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030707193839.C9758@suse.de>
References: <20030707123448.GA1905@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030707123448.GA1905@brodo.de>; from linux@brodo.de on Mon, Jul 07, 2003 at 02:34:48PM +0200
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
To: Dominik Brodowski <linux@brodo.de>
Cc: anders@trudheim.com, cpufreq@www.linux.org.uk

On Mon, Jul 07, 2003 at 02:34:48PM +0200, Dominik Brodowski wrote:
 > > Hi there,
 > > 
 > > Is there any chance of getting the CPUFreq patch rebased against
 > > 2.4.22-pre3 ?
 > 
 > I'll be working on an updated version within the next few days, check
 > http://www.codemonkey.org.uk/cpufreq/ for updated patches, please.
 > 
 > > I have been using the two patches linux-2.4.20-cpufreq.patch and
 > > cpufreq-centrino.patch against 2.4.21-rc7-ac1 since June 12th without
 > > any problems. From what I can tell, it is working very well indeed, so
 > > if it could be included in -pre4 it'd be great.
 > 
 > IMHO it's no stuff for 2.4.22. Davej/Russell, what's your opinion about 2.4.
 > in general?

I've no objection really, but it does mean that we would be introducing
an already obsolete interface into mainline. (~Not htat that's really a
problem, we did already for 2.5 anyway).

        Dave

-- 
| Dave Jones.        http://www.codemonkey.org.uk
| SuSE Labs
