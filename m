From: Daniel Bonniot <Daniel.Bonniot@inria.fr>
Subject: Re: Centrino: undervolting and further reducing heat
Date: Wed, 25 May 2005 15:35:25 +0200
Message-ID: <d71upb$lru$1@sea.gmane.org>
References: <d6f982$h87$1@sea.gmane.org>
	<d6fp66$egd$1@sea.gmane.org>	<d6gi6v$s1j$1@sea.gmane.org>
	<20050525130005.GE32472@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050525130005.GE32472@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk


> IIRC recent xorg do have some power saving options for radeon.
> I don't remember if its in CVS or if patches have been committed though,
> or if this work only for mobile versions.

Yes, I'm using Xorg 6.8.2 (-10 from Ubuntu), and the xorg driver does have 
power saving options, although they are not on by default (it's the 
DynamicClocks option). The proprietary drivers enable it by default. My 
preliminary experiments seem to show that you can save further by 
underclocking the radeon card (a Mobility in my case).

Daniel
