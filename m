From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] cpufreq: allow ondemand governor as default
Date: Tue, 8 Mar 2005 18:37:08 +0100
Message-ID: <20050308173708.GA15124@isilmar.linta.de>
References: <20050304011359.GA32684@aquarid.physics.uwo.ca>
	<20050306170625.GA2034@isilmar.linta.de>
	<20050306215106.GA25034@redhat.com>
	<20050307174150.GC31985@poupinou.org>
	<20050307175719.GA23932@isilmar.linta.de>
	<20050308094005.GF31985@poupinou.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050308094005.GF31985@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Dave Jones <davej@redhat.com>, Rob Weryk <rjweryk@uwo.ca>, cpufreq@lists.linux.org.uk

On Tue, Mar 08, 2005 at 10:40:05AM +0100, Bruno Ducrot wrote:
> Hi Dominik,
> 
> On Mon, Mar 07, 2005 at 06:57:19PM +0100, Dominik Brodowski wrote:
> > On Mon, Mar 07, 2005 at 06:41:50PM +0100, Bruno Ducrot wrote:
> > > And I dont remember what happens when the driver dont use the frequency
> > > table helpers (geode)
> > 
> > frequency table helpers do not enter the picture here; let me draw a
> > picture:
> > 
> > 	.-----------------.                 .-----------------------------.
> > 	|  cpufreq core   |-----------------|  cpufreq ->target drivers   |
> > 	|_________________|                 |_____________________________|
> > 		|					    |
> > 		|					    |
> > 	.-----------------.		.-----------------------------------.
> > 	|   governors     |		| frequency table helpers (optional)|
> > 	|_________________|		|___________________________________|
> > 
> > > or is already capable for automaticaly state switching (longrun).
> > 
> > longrun or, in general, ->range() cpufreq drivers do not need governors at
>                             ^^^^^
>               This was changed for ->setpolicy() ?

not yet :) It's on my TODO list, though....

	Dominik
