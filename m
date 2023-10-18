Return-Path: <cpufreq-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E02CDB47E
	for <cpufreq@archiver.kernel.org>; Wed, 18 Oct 2023 16:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjJRQkr (ORCPT <rfc822;cpufreq@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjJRQkq (ORCPT
        <rfc822;cpufreq@vger.kernel.org>); Wed, 18 Oct 2023 12:40:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005DF116;
        Wed, 18 Oct 2023 09:40:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6859FC433C8;
        Wed, 18 Oct 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697647244;
        bh=UYrGuDLmrae9g+wRf305lJHUD/vBz354DMg/lCZEsvs=;
        h=Date:From:To:Cc:Subject:From;
        b=NcyF4FAgjGwCDt588Q/cbLFx1OiSVhjiQLt/UlpHvHPMyoY+nWad2rId6sBe3tjyl
         T/cJxB1RYWfVh0O/su+PbBoat8u+PIm+opFD/QTTBQoFzbepllqHp6c9aqkEImqLa9
         v7B0Gbmi0MQ8Gg1edgYNPneOCh2JmepMNO7R4SvU=
Date:   Wed, 18 Oct 2023 12:40:43 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     cpufreq@vger.kernel.org
Cc:     postmaster@vger.kernel.org
Subject: RFC: sunsetting the cpufreq list
Message-ID: <20231018-lunchroom-sierra-a85b06@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <cpufreq.vger.kernel.org>
X-Mailing-List: cpufreq@vger.kernel.org

Hello, all:

We are currently in the process of migrating vger lists to new infrastructure,
and it seems like a good time to evaluate if it is a good time to sunset some
of the less active lists.

The cpufreq list is archived on https://lore.kernel.org/cpufreq/ and it
appears to be mostly inactive since 2015. It appears that the preferred list
for cpufreq discussions and patches is the linux-pm list.

I recommend that we close this list with a bounce message going out to anyone
attempting to post to it that they should send their messages to
linux-pm@vger.kernel.org instead.

Are there any objections to this plan?

Best regards,
Konstantin
