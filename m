From: David C Niemi <dniemi@verisign.com>
Subject: Re: Issues with ondemand governor
Date: Mon, 29 Nov 2010 15:03:11 -0500
Message-ID: <4CF406FF.9000504@verisign.com>
References: <AANLkTi=0hbJ=N6bLRgrmDVzMVZgPyT5gNZbQDhgMV=J=@mail.gmail.com> <4CEA959F.9000505@verisign.com> <20101126223815.GU30563@anthem.async.com.br> <4CF3C3B4.3000209@verisign.com> <alpine.LFD.2.00.1011291037350.9313@xanadu.home> <20101129180023.GA23105@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101129180023.GA23105@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Christian Robottom Reis <kiko@linaro.org>, Vishwanath Sripathy <vishwanath.sripathy@linaro.org>, linaro-dev@lists.linaro.org, cpufreq@vger.kernel.org

Dave Jones wrote:
> On Mon, Nov 29, 2010 at 10:38:52AM -0500, Nicolas Pitre wrote:
>  > On Mon, 29 Nov 2010, David C Niemi wrote:
>  > 
>  > > I certainly have no objections to it going into the Linaro tree, though
>  > > I was hoping to get it into the main kernel tree too.
>  > 
>  > What might prevent it from going into mainline at the moment, if 
>  > anything?
>
> What patch are we talking about ? 
> The sampling_down_factor tunable was added in commit 3f78a9f7fcee0e9b44a15f39ac382664e301fad5
>
> 	Dave
>   
Excellent!  I had not seen that, but I'm glad it made it in.  Thanks for
the update.

DCN
